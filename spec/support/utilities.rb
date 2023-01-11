# ログインする
def sign_in_as(user)
    get login_path, params: { session: { email: user.email,
                                        password: user.password } }
  end