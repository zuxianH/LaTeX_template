-- Function to handle citations
function Cite (cite)
  local citations = {}
  for _, citation in ipairs(cite.citations) do
    table.insert(citations, citation.id)
  end
  return pandoc.RawInline('latex', '\\cite{' .. table.concat(citations, ',') .. '}')
end


-- Function to handle specific double-bracketed terms
function Str(elem)
  -- Check if the text is enclosed in double brackets
  if elem.text:match("^%[%[(.-)%]%]$") then
    -- Extract the text without brackets and return as plain text
    local term = elem.text:match("^%[%[(.-)%]%]$")
    return pandoc.Str(term)
  end
end
