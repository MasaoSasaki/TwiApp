class ApplicationController < ActionController::Base

  # ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource)
    posts_path
  end

  # # ログアウト後に遷移するpathを設定
  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # Deviseの影響によるposts#create時のテンプレートエラー回避用
  # def self.render_with_signed_in_user(user, *args)
  #   ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
  #   proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
  #   renderer = self.renderer.new('warden' => proxy)
  #   renderer.render(*args)
  # end

end
