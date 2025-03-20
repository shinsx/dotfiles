function toggleApp(appName)
  local app = hs.application.get(appName)

  if app == nil or app:isHidden() then
    hs.application.launchOrFocus(appName)
  else
    app:hide()
  end
end

local appBinds = {
  { prefix = { 'alt' }, key = "space", appName = "Ghostty" },
  { prefix = { 'alt' }, key = "s", appName = "Slack" },
  { prefix = { 'alt' }, key = "t", appName = "Clock" },
  { prefix = { 'alt' }, key = "d", appName = "Docker Desktop" },
}

for _, appBind in ipairs(appBinds) do
  hs.hotkey.bind(appBind.prefix, appBind.key, function()
    toggleApp(appBind.appName)
  end)
end
