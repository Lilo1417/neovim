return {

    s({trig="upk", snippetType="autosnippet"},
        fmta(
            "\\usepackage{<>}",
            { i(1) }
        )
    ),
    s({trig="ugp", snippetType="autosnippet"},
      fmta(
            "\\usepackage{graphicx}\n<>",
          { i(1) }

      )
    ),
    s({trig="iim", snippetType="autosnippet"},
        fmta(
            "\\includegraphics[width=<>pt]{<>}",
            {
                i(1),
                i(2, "imagePath")
            }
        )),
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
s({trig="fre", snippetType="autosnippet"},
    fmta(
        [[
        \begin{figure}
            \centering
            \includegraphics[width=<>]{<>}
            \caption{<>}
            \label{<>}
        \end{figure}
        ]],
    {
        i(1),
        i(2),
        i(3),
        i(4)
    }
    )
),
}
