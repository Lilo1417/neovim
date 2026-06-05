return {
    -- Examples of Greek letter snippets, autotriggered for efficiency
    s({trig="tle", snippetType="autosnippet"},
      fmta(
        "\\title{<>}",
        { i(1) }
      )
    ),

    s({trig="autr", snippetType="autosnippet"},
      fmta(
        "\\author{<>}",
        { i(1) }
      )
    ),

    s({trig="dte", snippetType="autosnippet"},
      fmta(
        "\\date{<>}",
        { i(1) }
      )
    ),

    s({trig="mktle", snippetType="autosnippet"},
      fmta(
          [[
            \maketitle
            <>
          ]],
          { i(1) }

      )
    ),
s({trig="nv", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
),
s({trig="cc", snippetType="autosnippet"},
  fmta(
    [[
      \chapter{<>}
      <>
    ]],
    {
      i(1),
      i(2),
    }
  )
),
s({trig="ss", snippetType="autosnippet"},
  fmta(
    [[
      \section{<>}
      <>
    ]],
    {
      i(1),
      i(2),
    }
  )
),
s({trig="ubss", snippetType="autosnippet"},
  fmta(
    [[
      \subsection{<>}
      <>
    ]],
    {
      i(1),
      i(2),
    }
  )
),
s({trig="bubs", snippetType="autosnippet"},
  fmta(
    [[
      \subsubsection{<>}
      <>
    ]],
    {
      i(1),
      i(2),
    }
  )
),
s({trig="ll", snippetType="autosnippet"},
    fmta(
        "\\label{<>}",
        { i(0) }
    )
),

}

