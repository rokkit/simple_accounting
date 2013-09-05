# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :home, 'Простая бухгалтерия', root_path
    primary.item :bank_books, "Лицевые счета", bank_books_path
    primary.item :users, 'Пользователи', users_path
    if user_signed_in?
      if current_user.has_role? :admin
        primary.item :admin_tools, "Администрирование" do |admin_actions|
          admin_actions.item :activities, "Журнал системы", activities_path
        end
      end
      primary.item :user, current_user.email do |profile_actions|
        profile_actions.item :profile, "Профиль",  user_path(current_user)
        profile_actions.item :logout, "Выход",  destroy_user_session_path, :method=>'delete'
      end
    else
      primary.item :login, "Войти в систему", new_user_session_path
    end
    primary.dom_class = 'nav'
  end

end
