def is_logged_in?
    if session[:user_id]
        return true
    else
        return false
    end
end

def current_user
    if is_logged_in?
        find_user_by_id(session[:user_id])
    else
        return nil
    end
end

def is_admin?
    user = current_user()
    if user && user["is_admin"] == "t"
        return true
    else
        return false
    end
end