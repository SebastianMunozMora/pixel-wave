# Allow additional tags and attributes for Action Text and general sanitization

Rails.application.config.after_initialize do
  # Allow additional tags for Action Text
  ActionText::ContentHelper.allowed_tags = ActionText::ContentHelper.allowed_tags.to_a + ['iframe', 'div', 'img']

  # Allow additional attributes for Action Text
  ActionText::ContentHelper.allowed_attributes = ActionText::ContentHelper.allowed_attributes.to_a + ['src', 'alt', 'data-src', 'data-srcset', 'width', 'height', 'class', 'frameborder', 'allow', 'allowfullscreen']
end

# Allow additional tags and attributes globally for Action View sanitization
Rails.application.config.action_view.sanitized_allowed_tags = Rails.application.config.action_view.sanitized_allowed_tags.to_a + ['img', 'iframe', 'div']
Rails.application.config.action_view.sanitized_allowed_attributes = Rails.application.config.action_view.sanitized_allowed_attributes.to_a + ['src', 'alt', 'data-src', 'data-srcset', 'width', 'height', 'class', 'frameborder', 'allow', 'allowfullscreen']