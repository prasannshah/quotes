class WinSchedule
  WIN_USER_NAME = 'systemuser@logistixian.com'
  WIN_PASSWORD = 'win123456'
  UNAUTHORIZED = 'unauthorized'
  ERROR= 'error'
  LOGIN_URL = "http://integration.winwebconnect.com/api/v1/Login"
  SCHEDULE_URL = "http://integration.winwebconnect.com/api/v1/WASAPI"
  def self.authorize?
    post_body = {
        "Username": WIN_USER_NAME,
        "Password": WIN_PASSWORD,
        "RememberMe": false
    }
    header = {"Content-Type": "application/json", "Accept":"application/json"}
    begin
      response = RestClient.post(LOGIN_URL, post_body.to_json, header)
      authToken = response.cookies["authToken"]
      if authToken.nil?
        return false
      else
        set_win_token(authToken)
        return true
      end
    rescue Exception => e
      Rails.logger.error e.message
      return false
    end
  end

  def self.get_win_token
    $redis.get("win_token")
  end

  def self.set_win_token(token)
    $redis.set("win_token", token)
  end

  def self.fetch_schedules(params)
    win_token = get_win_token
    if win_token.nil?
      if authorize?
        win_token = get_win_token
      else
        return UNAUTHORIZED
      end
    end
    schedules = internal_fetch_schedule(win_token, params)
    if schedules == ERROR
      if authorize?
        win_token= get_win_token
      else
        return UNAUTHORIZED
      end
      schedules = internal_fetch_schedule(win_token)
    end
    schedules
  end

  def self.internal_fetch_schedule(token, params)
    auth = "authToken="+token
    cookies = {authToken: token}
    fix_options = { :fromType => "A", :toType => "A", :minCT => 2, :maxCT => 12, :maxConnections => 1, :daysOut=>0, :connectionType => "S", :excludeCodeShare => false, :viaPorts => "", :includeFlight => true, :includeFreighter => true, :includeRFS=>true, :includeTrain =>true, :carriers => ""}
    # params = {:fromCode => "BOM", :toCode => "LHR", :date => "2016-12-12" }
    options = fix_options.merge(params)
    url = "#{SCHEDULE_URL}?#{options.to_query}"
    begin
      response = RestClient.get(url, {authorization: auth, cookies: cookies, content_type: 'application/json', accept: 'application/json'})
      set_win_token(response.cookies["authToken"])
      return response
    rescue Exception => e
      Rails.logger.error e.message
      return ERROR
    end
  end
end

