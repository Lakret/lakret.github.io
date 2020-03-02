The process of programming is hard to verbalize. We write algorithms everyday, yet we rarely talk about algorithms for writing those algorithms. Things like inspiration, creativity, having a hunch, or Εύρηκα! moment, are not very predictable. Still, there are approaches that you can apply to move from "The program needs to have feature X" to having the feature X running in production. Here, I will catalogue some of them. We'll also look at the challenges inherent to programming that those strategies help to overcome.

## REPL-driven development

**Challenge:** Software is intangible.

There are many contenders for the "the hardest thing about programming is..." prize. Intangibility of software is somewhere at the top, though.

Hardware engineers use sophisticated CAD packages, and can experiment with physical prototypes. You can touch stuff. You can see the thing as a whole. Yet, in software our overview point is often a window of 20 lines from some particular file. It's very easy to get lost in minutiae. "How will the system

## TDD

## Top-down design and placement of things

**Challenge:** lack of spatial awareness.

<!-- TODO: -->

```rust
#[derive(Debug)]
enum Colors {
  White,
  Black,
  RGB(u32, u32, u32),
  HSL(f64, f64, f64)
}

fn main() {
  println!("yo! color <=> {:?}", Colors::RGB(120, 120, 120));
}
```