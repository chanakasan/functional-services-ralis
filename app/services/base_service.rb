class BaseService
  include Rails.application.routes.url_helpers
  
  include ApplicationHelper

  def self.call(*, **)
    new(*, **).call
  end

  def self.i18n_prefix
    "services.#{name.underscore.gsub('/', '.')}"
  end

  def t(key, **)
    I18n.t(key, scope: self.class.i18n_prefix, **)
  end
end
