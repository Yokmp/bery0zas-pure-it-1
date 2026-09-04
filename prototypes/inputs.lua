local inputs = {
  {"R",         "bery0zas-rotate-right",      "rotate"},
  {"SHIFT + R", "bery0zas-rotate-left",       "reverse-rotate"},
}

for _, input in ipairs(inputs) do
  data:extend{{
    type = "custom-input",
    name = input[2],
    key_sequence = input[1],
  }}
end
