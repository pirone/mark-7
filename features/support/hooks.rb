# REGEX ou Expressão Regular
# Contem => *
# termina com => $
# começa com => ^

Before do
  @nav = Navbar.new
  @side = Sidebar.new
  @login_page = LoginPage.new
  @tarefas_page = TarefasPage.new
  @perfil_page = PerfilPage.new

  page.current_window.resize_to(1440, 900)
end

Before('@login') do
  @usuario = { email: 'nao_usar@mark7.com', senha: '123456' }

  @login_page.acessa
  @login_page.logar(@usuario[:email], @usuario[:senha])
end

After('@logout') do
  @nav.sair
end

After do |scenario|
  nome = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome = nome.tr(' ', '_').downcase!
  shot = "log/screenshots/#{nome}.png"

  page.save_screenshot(shot)
  embed(shot, 'image/png', 'Ta aqui o print')
end
