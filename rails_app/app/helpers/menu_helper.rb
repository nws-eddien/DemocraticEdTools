module MenuHelper

  def all_menues
    [user_manager_menu, media_time_menu]
  end
  def user_manager_menu
    {
      title: "User Manager",
      app_name: "UserManager",
      links: [
        {label: "Gruppen", path: [:user_manager, :groups]},
        {label: "Benutzer:innen", path: [:user_manager, :users]},
        {label: "Rollen", path: [:user_manager, :apps]},
      ]
    }
  end

  def media_time_menu
    {
      title: "Medienzeit",
      app_name: "MediaTime",
      links: [
        {label: "Einstellungen", path: media_time_media_global_setting_path},
        {label: "Login Display", path: media_time_login_display_path},
      ]
    }
  end
end
