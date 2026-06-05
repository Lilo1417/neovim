return {
    s({trig="uli", snippetType="autosnippet"},
    fmta(
        [[
        \begin{itemize}
            <>
        \end{itemize}
        ]],
        {
            i(1)
        }
        )
    ),
    s({trig="ii", snippetType="autosnippet"},
        fmta("\\item <>", { i(0) })
    ),
    s({trig="orli", snippetType="autosnippet"},
    fmta([[
        \begin{enumerate}
            <>
        \end{enumerate}
    ]],
    {
        i(1)
    })
),
}
