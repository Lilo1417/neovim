local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
-- Combining text and insert nodes to create basic LaTeX commands
s({trig="tt", dscr="Expands 'tt' into '\texttt{}'", snippetType="autosnippet"},
  fmta(
    "\\texttt{<>}",
    { i(1) }
  )
),
-- \frac
s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'", snippetType="autosnippet"},
  fmt(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2)
    },
    {delimiters = "<>"} -- manually specifying angle bracket delimiters
  )
),
-- Equation
s({trig="eq", dscr="Expands 'eq' into an equation environment"},
  fmta(
     [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
     { i(1) }
  )
),
-- Code for environment snippet in the above GIF
s({trig = "mm", snippetType="autosnippet"},
  fmta(
    "<>$<>$",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  )
),
s({trig = "qq", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>\\sqrt{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  )
),


}

