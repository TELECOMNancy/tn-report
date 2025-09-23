#let custom_outline(title) = context {
  strong(text(font:"Fira sans", size: 18pt)[#title])
  let headings = query(heading)
  let toc = ()
  for h in headings {
    let padd = (h.level -1 )*1em
    let page = counter(page).at(h.location())
    let ch = if h.level == 1 {
      strong(text(font:"Fira sans")[#context counter("h").display("1.")])
    } else {
      context counter("h").display("1.")
    }
    let heading = if h.level == 1{
      strong(text(font:"Fira sans")[ #h.body])
    } else {
      h.body
    }
    if h.supplement==[Chapitre] {
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
  }
  stack(dir: ttb, ..toc)
}