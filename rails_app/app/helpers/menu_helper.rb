module MenuHelper

  def all_menues
    [user_manager_menu, media_time_menu]
  end
  def user_manager_menu
    set_app("UserManager")
    {
      app: @app,
      links: [
        {label: "Gruppen", path: [:user_manager, :groups], allowed: policy(Group).index?},
        {label: "Benutzer:innen", path: [:user_manager, :users], allowed: policy(User).index?},
        {label: "Rollen", path: [:user_manager, :apps], allowed: policy(App).index?},
      ]
    }
  end

  def media_time_menu
    set_app("MediaTime")
    {
      app: @app,
      links: [
        {label: "Einstellungen", path: media_time_media_global_setting_path, allowed: policy(MediaGlobalSetting).show?},
        {label: "Login Display", path: media_time_login_display_path, allowed: true},
      ]
    }
  end

  private

  def set_app(identifier)
    @app = App.find_by_identifier(identifier)
  end
end
