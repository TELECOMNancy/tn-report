#let custom_outline(title) = locate(loc => {
  strong(text(size:15pt)[#title])
  let headings = query(heading, loc)
  let toc = ()
  for h in headings {
    let padd = (h.level -1 )* 1em
    let page = counter(page).at(h.location())
    let ch = if h.level == 1 {
      strong(text(font:"Fira sans")[#counter("h").display("1.")])
    } else {
      counter("h").display("1.")
    }
    let heading = if h.level == 1 {
      strong(text(font:"Fira sans")[#h.body])
    } else {
      h.body
    }
    toc.push(
      {
        if h.level == 1 [
          #v(3em)
        ] else [
          #v(3em)
        ]
      } + 
      box[#pad(left: padd)[#link(h.location())[#{counter("h").step(level: h.level)}#ch#sym.space.third#heading]]] + 
      " " +
      box(width: 1fr)[
        #if h.level != 1 [
          #repeat([.])
        ]
        ] + 
      [ #page.join()]
    )
  }
  stack(dir: ttb, ..toc)
})
