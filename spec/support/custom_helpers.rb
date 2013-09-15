# encoding: utf-8
#
# Aquí deberían añadirse todos los helpers propios que se vayan a utilizar
# en las pruebas.
#

module CustomHelpers
  #
  # Autentica un usuario
  #
  # Visita el formulario de «login» y lo autentica. Confía en una
  # contraseña por defecto, aunque se le puede pasar como opción
  # una alternativa.
  #
  # @param [String] text  Usuario a autenticar.
  # @param [Hash]   opts  +password+: contraseña para la autenticación.

  def sign_in_as_user(user, opts = {})
    visit opts[:login_path] || "/teachers/sign_in"
    fill_in "Email",    :with => user.email
    fill_in "Contraseña", :with => "password"
    debugger
    click_button "Aceptar"
    page.should have_content("Has sido registrado correctamente.")
  end

  def sign_in_as_admin(user, attrs = {})
    sign_in_as_user(user, "/users/sign_in")
  end
end
