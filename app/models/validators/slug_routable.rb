class Validators::SlugRoutable < ActiveModel::Validator
  def validate(record)
    path  = record.slug
    valid = ! Rails.application.routes.routes.any? do |r|
      # Any route's base dir name should
      # not match the slug path name
      r.path.spec.to_s[1..-1].split('/')[0] == path
    end

    record.errors[:slug] << I18n.t('gannon.slug.validation.route') unless valid
  end
end
