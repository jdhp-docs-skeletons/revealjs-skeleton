# TODO

## Skeleton

- [ ] Internal links (especially to make a table of content at the begining fo
      long documents)
- [x] Improve Mathjax support: fix the conflict between Markdown parser (the
      "Marked" plugin) and Mathjax by desabling Markdown parser between
      '$$...$$' like for code blocks '```...```' to avoid the use of
      additionnal escape characters
      - Marked: https://github.com/chjj/marked/issues?utf8=%E2%9C%93&q=mathjax
          - https://github.com/chjj/marked/pull/799
          - https://github.com/chjj/marked/issues/722
          - https://github.com/chjj/marked/pull/723
          - https://github.com/chjj/marked/pull/591
          - https://github.com/chjj/marked/issues/546
          - https://github.com/chjj/marked/issues/353
          - https://github.com/chjj/marked/pull/180
          - https://github.com/chjj/marked/issues/105
      - Reveal.js: https://github.com/hakimel/reveal.js/issues?utf8=%E2%9C%93&q=mathjax
      - SOLUTION:
          - https://github.com/hakimel/reveal.js/issues/1359
          - https://github.com/hakimel/reveal.js/issues/702
          - https://github.com/hakimel/reveal.js/pull/1205
- [ ] The LaTeX "Algorithmic" environment desn't seems to work with MathJax... Investigate on this.
    - List of supported environments: http://docs.mathjax.org/en/latest/tex.html#environments
    - In the meanwhile: http://www.lvcsr.com/typesetting-algorithms-in-restructuredtext.html
    - Or imitate this with Markdown tables + inline LaTeX...
- [ ] Try KaTeX instead Mathjax ?
    - https://github.com/Khan/KaTeX
    - Plus: much faster than Mathjax
        - http://www.intmath.com/cg5/katex-mathjax-comparison.php
    - Cons: (as of 2014) "KaTeX only supports a limited subset of the functionality provided by MathJax"
        - http://meta.mathoverflow.net/questions/1908/katex-vs-mathjax
        - KaTeX commands: https://github.com/Khan/KaTeX/wiki/Function-Support-in-KaTeX
        - Mathjax commands: http://docs.mathjax.org/en/latest/tex.html#supported-latex-commands
- [x] Add a makefile in "figs/" to make/clean figures from scripts (Python,
      ...)
- [ ] Improve the init_skeleton.sh script (add safety checks: are the variable
      defined ? is the skeleton branch already exist ? ...)
- [x] Put CSS in a dedicated file (in "style/html/" like the rst-skeleton)
- [ ] Improve the default theme (i.e. CSS file)
- [x] Split content/main.md
- [x] Make the French branch
- [ ] Write the PDF target in the Makefile (use https://github.com/astefanutti/decktape ?)
- [ ] Improve the "open" target (use Node.js to serve Reveal.js) ; check if it works well offline
- [x] Use gitsubmodule to get the latest version of RevealJS
- [x] Use gitsubmodule for figs/logos
- [x] Make a snippets document in a dedicated git repository
- [ ] Add a hint about navigation usage on the title page
    - Make an animated instruction on the title page so that users
      understand it's not a static HTML page but an interactive document
- [ ] Improve SEO ?
    - [ ] Add HTML meta tags: author/subject/keywords/language/...
    - [ ] Before the document is published on JDHP, convert MD to HTML (with
          data-markdown https://gist.github.com/1343518 or marked
          https://github.com/chjj/marked as described in
          https://github.com/hakimel/reveal.js#markdown) to make content
          reachable by search engines ?
    - [ ] Publish (on jdhp) the "handout" version (all slides visible)
          and only run "normal" slide view when the user clic on a specific buton 
          or press a given key... Then, by default all content is reachable
          by search engines (and also it gives an overview of the content
          of the document for users) and start presentation on demand only...
- [x] Use main.html or index.html ?
- [x] Thought about figs/logos: it is copied for each document in
      www.jdhp.org/docs/ (waste of space)
- [x] Find a solution to avoid "reveal.js/" redundancy in "www.jdhp.org/docs/"
- [ ] Make a clean bibliography (like bibtex) from .bib files (found a .bib parser/renderer in JS) ?
- [ ] Is the HTML document compliant with mobile devices (see Google's
      advices) ?

### MathsJax/Markdwon conflict

#### NO

$$
\begin{array}{cc}
  a & b \\
  c & c
\end{array}
$$

#### OK

$$
\\begin{array}{cc}
  a & b \\\\
  c & c
\\end{array}
$$

#### OK

<div>
$$
\begin{array}{cc}
  a & b \\\\
  c & c
\end{array}
$$
</div>

#### Solution

- https://github.com/hakimel/reveal.js/issues/1359
- https://github.com/hakimel/reveal.js/issues/702
- https://github.com/hakimel/reveal.js/pull/1205

`$$
\begin{array}{cc}
  a & b \\
  c & c
\end{array}
$$`

## Document

- [ ] 
