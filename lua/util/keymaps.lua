local function opts(desc, additional_opts)
  local default_opts = {
    desc = desc,
    silent = true,
    noremap = true,
  }

  if additional_opts then
    for k, v in pairs(additional_opts) do
      default_opts[k] = v
    end
  end

  return default_opts
end

return opts
