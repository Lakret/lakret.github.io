I’ve been learning, doing, and teaching software development with functional programming languages and techniques for the last 8 years. I recently had several discussions with fellow functional programmers, and I found (to my surpise!) that a lot of opinions that I hold based on my experience are somewhat controversial among some of them. So, I decided that I should write it down somewhere and, hopefully, discuss some topics in more depth. Maybe you could show me the error of my ways, or maybe you agree with some or all of it, but feel that this is a weird point of view — which it is, I believe, not.

## Functional programming is mainstream, and we should make some changes because of it

For a long time people considered FP to be some kind of edgy new thingy or maybe something that is taught and discussed within academic setting only. This is no longer a case: even JavaScript is getting slowly rebranded as a functional language nowadays. React seems to emerge as a winner in the frontend frameworks Game of Thrones, and few people would argue that it is inspired by FP to a large extent. Redux is also quite popular, and there’s [immutable.js](https://immutable-js.github.io/immutable-js/). Bloomberg and Facebook guys even did something that I’m personally very exited about: [BuckleScript](https://bucklescript.github.io/) and [Reason](https://reasonml.github.io/) may very well make OCaml popular. Just look at the level of IDE support of OCaml in VS Code:

![References search, type inference with tooltips, complete syntax support, errors showing up immediately, refactoring — a dream come true.]({{ site.url }}/assets/controversial/01.png)

*References search, type inference with tooltips, complete syntax support, errors showing up immediately, refactoring — a dream come true.*

Scala developers are needed pretty much everywhere thanks to [Spark](http://spark.apache.org/) and [Akka](https://akka.io/). Elixir shows fast and steady growth thanks to [Phoenix framework](http://www.phoenixframework.org/) mostly (and if you haven’t you should check it out — I think that’s the best backend web-framework so far). Future looks very bright indeed.

For us, functional programmers, that also means that we should adapt to a new reality. Some of our communities are still … *arrogant* is the word, I believe. I think the main task for us all right now is to be helpful and encouraging to the people who join our community. One kind word may be a difference between somebody learning and appreciating those techniques or feeling that people are hostile and it’s a community you’re better avoid. I personally decided to investigate Elixir further in a large part because of friendly and helpful attitude in the respective community. [ElixirForum](https://elixirforum.com/) just feels like a good place.

And don’t think that arrogance is small or insignificant issue. You see, *arrogance kills*. I think that arrogance made it so we still don’t have any LISP that we can use in production (sorry, Clojure, I really tried, but waiting 30 seconds till interpreter starts … is just not my cup of tea). Arrogance of some Scala devs made us look like people with whom it’s not necessarily pleasant to work with in Java circles. And those “you just don’t understand Haskell *good enough*” arguments? All of that has happend before, so let’s watch this and not repeat mistakes of yore:

<iframe width="740" height="420" src="https://www.youtube.com/embed/YX3iRjKj7C0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

*Robert Martin describes how community arrogance killed SmallTalk*

## KISS and YAGNI principles apply to any paradigm

Functional programming gives us superior tools to make our code reusable. If used right, they can bring a lot of joy and ease in the development. But when they are misused, they can as easily make your code unreadable, hard to support and understand, and hard to fix and change.

You *can* write very high-level generic code with Scala. But should you? Libraries like [Scalaz](https://github.com/scalaz) and [Shapeless](https://github.com/milessabin/shapeless) existed for years now. They do help a lot in some cases, but should you really use them to make a glorified webpage? People who are used to this kind of type-level programming may feel extremely comfortable with it, but they are often oblivious to a rather obvious array of problems from using this style:

- Those 2 pages long type errors? Ugh.
- Compilation speed is an obvious problem, and it may become an issue even from far more innocuous techniques, like usage of magnet pattern in Spary and Akka-Http causing a lot of people wait in anguish while their IDE tries to figure out which particular type this route is expecting to see
- There’s no unified approach still. [Cats](https://github.com/typelevel/cats), for example, looks much more appealing to me, than Scalaz, but would I mindlessly bring it as a dependency for a landing page? Unlikely.
- Some languages are changing quite rapidly; things that worked a year ago may not work a year from now. In Scala land, when [Dotty](http://dotty.epfl.ch/) lands, do you expect your type-level abstractions to still work? And if the whole of your codebases uses them, how much effort bringing everything up to speed will require?
- Code written with the help of those libraries is often harder to read and maintain. Let me just show you a couple of screenshots, and you can imagine trying to figure that out in 4 AM in the morning, because some server crashed, and logs bring you to this place of doom:

![Taken from Shapeless sources]({{ site.url }}/assets/controversial/02.png)

*Taken from Shapeless [sources](https://github.com/milessabin/shapeless/blob/master/examples/src/main/scala/shapeless/examples/linearalgebra.scala)*

![Scalaz in all of its controversial beauty]({{ site.url }}/assets/controversial/03.png)

*Scalaz in all of its controversial beauty*

Does it mean that you should not use Scalaz, or Shapeless, or Cats, or that tasty GHC extension you’ve read a lot good things about recently? I don’t believe so. The only thing that I’d call for is to carefully consider the implications of such choices, especially future maintenance costs. If you’re writing a library and providing an interface powered by those tools underneath will make your users happier and help them avoid writing a lot of boilerplate — this may be fine. If you’re writing a small example service with a goal to persuade others on your team to start using functional language as well — this may do the exact opposite (and yeah, I’ve been there).

The same argument applies to macros extravaganza we see in the wild sometimes. Macros are amazing, but don’t use them for every damn thing.

## Immutability and separation of side effects is the core of functional programming

Over the years a lot of ground-breaking research happend in functional programming languages circles. There’s [effect systems](https://en.wikipedia.org/wiki/Effect_system), there’s the whole [monadic mojo](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html), there’s [functional reactive programming](https://elm-lang.org/), there’s [optics](https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/basic-lensing), [recursion schemes](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.41.125&rep=rep1&type=pdf), [zippers](https://en.wikipedia.org/wiki/Zipper_(data_structure)), … But in the core of it all sits a nice, easy, and extremely powerful way of thinking about computation itself: [lambda calculus](https://en.wikipedia.org/wiki/Lambda_calculus).

Functional programming became mainstream because of this way of thinking about programms as a collection of pure functions, results of which you can later use to perform different side-effects separetely. The state not buried deep in some memory locations, but shown explicitly. The state being debuggable, replayable, and representable as immutable datastructures — this makes FP such a good fit for our multi-core, multi-server, multi-datacenter world.

Separate handling of side-effects makes code easier to maintain, debug, extend, and reuse. There’s less possibility of external races or dead/live-locks.

Even if Haskell with all of it monad transformers and do-notations trickery, Scala with its eerily weird way of conjoining functional programming with the evil twin (OOP), and numerous others will go extinct, as long as this lesson of immutability and purity remains, functional programming will live on. I’m extremely interested in most of those newer techniques, and used some of them quite successfully; but still, 99% of this success is due to immutability and purity.

## Static vs. Dynamic debate is not nearly as important as people tend to think

This is a direct conclusion from the previous section as well: for far too long FP community has been divided by this imaginary battle-line. The truth is rather simple: people are successful with both dynamic and static languages; you can misuse macros the same way you can misuse type-level programming; there’s no conclusive evidence for either side being better; it seems that the answer is either “it depends” or “it’s not that important”.

I’ve used both static and dynamic languages; FP, OOP, and procedular languages. I’m pretty sure that people tend to make much less errors when they use Scala/OCaml/F# than when they use Java or C#; I’m also pretty sure that people make less errors when they use Erlang/Elixir/Clojure than when they use Python or Ruby. But do people writing Erlang err more often than those who use OCaml? My experience tells me that this is not the case; I believe that a lot of supposed “error prevention” of static functional programming languages is due to immutability and side-effects separation, not due to static type systems. Personally, I never felt any effect going either dynamic or static way. [Limited](https://danluu.com/empirical-pl/) research that we have tells us that this seems to be the conclusion as well.

The take away from this: before you brand your fellow functional programmers heretics because they don’t appreciate all the power of IO monad or because they are not that comfortable with macros, do consider that you have something more important in common:

<span class="hero">
λ
</span>