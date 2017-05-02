module ChatHelper
  def online?()
    str = '<svg width="14" height="14" id="Green_Ball" data-name="Green Ball" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2 2"><defs><style>.cls-1{fill:#090;}</style></defs><circle class="cls-1" cx="1" cy="1" r=".9"/></svg>'
	str.html_safe
  end
end