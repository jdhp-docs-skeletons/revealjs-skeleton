# TODO

## Skeleton

- [ ] Add a makefile in "figs/" to make/clean figures from scripts (Python,
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
- [ ] Use main.html or index.html ?
- [x] Thought about figs/logos: it is copied for each document in
      www.jdhp.org/docs/ (waste of space)
- [x] Find a solution to avoid "reveal.js/" redundancy in "www.jdhp.org/docs/"
- [ ] Make a clean bibliography (like bibtex) from .bib files ?
- [ ] Is the HTML document compliant with mobile devices (see Google's
      advices) ?

## Document

- [ ] 
