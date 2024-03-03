module MenuHelper

  def all_menues
    [user_manager_menu, media_time_menu, rulebook_menu]
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

  def rulebook_menu
    set_app("Rulebook")
    {
      app: @app,
      links: [
        {label: "Regeln", path: rulebook_rules_path, allowed: policy(Rule).show?},
        {label: "Kategorien", path: rulebook_rule_categories_path, allowed: policy(RuleCategory).show?},
        {label: "Typen", path: rulebook_rule_types_path, allowed: policy(DecisionMakingUnit).show?},
        {label: "Räume", path: rooms_path, allowed: policy(Room).show?},
        {label: "Entscheidungsgremien", path: rulebook_decision_making_units_path, allowed: policy(DecisionMakingUnit).show?},

      ]
    }
  end

  private

  def set_app(identifier)
    @app = App.find_by_identifier(identifier)
  end
end
