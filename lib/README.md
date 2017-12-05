## Testowanie Aplikacji Ruby, 2017/18

## :new: Egzamin – projekt „Mocking Hell”

Repozytorium z projektem należy podłączyć do GitHub Classroom.
Projekty należy zintegrować darmowymi wersjami serwisów
[Travis CI](https://docs.travis-ci.com) i [Code Climate](https://codeclimate.com).

Terminarz:

* Prace oddane po 09.01.2018 – ocena obniżona.
* Prace oddane po 16.01.2018 – ocena ndst z egzaminu w pierwszym terminie.

### :new: Konfiguracja usługi Code Code Climate

1. Logujemy się na _codeclimate.com_, gdzie autoryzujemy konto z GitHub.
  - Wybieram kategorię _Open Source_.
  - Klikamy dwa razy na opcję _Add Repo_ obok naszego repozytorium mocking-hell.
  - W przypadku repozytoriów publicznych, Code Climate jest już zintegrowany i nie musimy łączyć żadnych tokenów.
2. W celu wykonania dalszej konfiguracji, która polega na zaimplementowaniu _Test Coverage_ potrzebny jest program testowy. Sugeruję skopiować jeden z CodeQuizzes.
 - W swoim repozytorium mocking-hell wprowadzamy porządek folderów znany nam z hello-rsepc (lib, spec).
 - Tworzymy plik Gemfile o treści:

 ```yml
  source 'https://rubygems.org'

  gem 'rspec', :require => false, :group => :test
  gem 'simplecov', :require => false, :group => :test
 ```

  -

### Konfiguracja usługi Travis CI

Zmieniłem uprawnienia uprawnienia w repozytoriach z Classrom na Admin co powinno
umożliwić podłączenie testów do Travis CI. W tym celu użytkownik wykonujemy
kolejno:

1. Logujemy się na _travis-ci.org_, gdzie autoryzujemy konto z _github.com_.
2. Logujemy się na _github.com_:
   - wybieramy my-rspec → hello_rspec_user
   - w Settings → Integrations & Services wykonujemy Add service → Travis CI
   - uzupełniamy dane:
     * User: login na _github.com_
     * Token: _travis-ci.org/profile_, klikamy na „oczko” przy tokenie i wklejamy token
     * zostawiamy puste Domain:
     * klikamy Update Service
3. Logujemy się na _travis-ci.org_:
   - wchodzimy na Profil
   - klikamy Sync Account
   - wybieramy organizację _my-rspec_ i włączamy swoje repozytorium
   - wykonujemy Sync Account
   - opcjonalnie klikamy w Trigger Build

Przykładowy plik konfiguracyjny dla usługi Travis CI.
```yml
language: ruby
rvm:
  - 2.4
script:
  - bundle exec rspec .
```

Dziękuję za pomoc studentom T. Adamczykowi i K. Kulewskiemu.


### Ruby

1. Konfiguracja środowiska do pracy z projektami w Ruby:
  - [Instalacja Ruby](http://rvm.io/rvm) – Ruby enVironment (Version) Manager
  - [Bundler](http://bundler.io) – provides a consistent environment
    for Ruby projects by tracking and installing the exact gems and
    versions that are needed.
    - instalacja gemów – [Miejsce na dysku Sigma + Laboratoria](https://inf.ug.edu.pl/aktualizacje-serwera-sigma)
  - Podstawowe gemy: rspec, [rubocop](http://rubocop.readthedocs.io/en/latest/).
  - [Instalacja edytora Atom](https://atom.io) i rozszerzeń (pakietów):
    * [linter](https://github.com/steelbrain/linter) i
      [linter-rubocop](https://atom.io/packages/linter-rubocop);
      [konfiguracja](http://rubocop.readthedocs.io/en/latest/),
      [enabled style cops](https://github.com/bbatsov/rubocop/blob/master/config/enabled.yml)
    * [script](https://atom.io/packages/script), ruby-test-switcher
    * [rspec](https://atom.io/packages/rspec) i
      [language-rspec](https://atom.io/packages/language-rspec)
  - Przykłady pokazujące jak to działa:
    [factorial.rb](wyklady/1-Classes_Modules/factorial.rb),
    [keyword_arguments.rb](wyklady/1-Classes_Modules/keyword_arguments.rb),
    [fox.rb](wyklady/1-Classes_Modules/fox.rb),
    [hello_world](wyklady/2-Hello_Bundler/hello_world]),
    [hello_bundler](wyklady/2-Hello_Bundler/hello_bundler).
1. Wprowadzenie do języka Ruby:
  - [Try Ruby](http://tryruby.org)
  - [Code Quizzes – Learn Ruby](http://www.codequizzes.com/ruby)
  - [Learn X in Y minutes][5], where X = Ruby
  - [Exercism – Ruby](http://exercism.io/languages/ruby/about); po instalacji wykonaj `exercism list ruby`
  - Learn X in Ruby, where X = [Hash, Array, Enumerable](http://ruby-doc.org/core-2.4.2/)
  - [How to Solve Coding Anti-Patterns for Ruby Rookies](http://www.sitepoint.com/how-to-solve-coding-anti-patterns-for-ruby-rookies/)
1. Refaktoryzacja albo przepisywanie kodu:
  - William C. Wake, Kevin Rutherford.
   [Refactoring in Ruby](http://www.refactoringinruby.info);
   [repo with source code](https://github.com/kevinrutherford/rrwb-code);
   [Ruby refactoring cheatsheet](http://ghendry.net/refactor.html).
  - [reek](https://github.com/troessner/reek) – code smell detector for Ruby.
  - [Clean Code JavaScript](https://github.com/ryanmcdermott/clean-code-javascript) –
   warte przeczytania, chociaż dotyczy języka JavaScript.

---

1. [Szablon projektu Ruby + RSpec](https://github.com/egzamin/solutions-tar).
2. Ogólnie o testowaniu:<br>
   - Learn X in Y minutes, where X = Rspec, Capybara, Factory Girl.
3. Wprowadzenie do RSpec.
4. Testy jednostkowe:
   - [Ruby](https://github.com/ruby/ruby/tree/trunk/test/ruby) – przykłady w _TestUnit_
5. [Mostly Static Pages](https://github.com/rails4/mostly_static_pages5) –
   testowanie kontrolerów i widoków:
   - [rspec-rails](https://github.com/rspec/rspec-rails).
6. Refaktoryzacja kodu.
7. Pokrycie kodu testami:
   - [simplecov][8].
8. Doubles, mocks i stubs.
9. Praca z *Legacy Code* (zastanym kodem, kodem niepokrytym testami).


### RSpec

1. Myron Marston and Ian Dees. [Effective Testing with RSpec 3][3].
1. Robert C. Martin. [Czysty kod](http://helion.pl/ksiazki/czysty-kod-podrecznik-dobrego-programisty-robert-c-martin,czykov.htm).
1. [Better Specs](http://betterspecs.org) – how to describe your methods, use context
1. [Octokit](https://github.com/octokit/octokit.rb) – many examples of excellent descriptions
1. [The RSpec Style Guide](https://github.com/reachlocal/rspec-style-guide)
1. [RSpec](https://relishapp.com/rspec) (on Relish):
    - [RSpec Core 3.6](https://relishapp.com/rspec/rspec-core/docs)
    - [RSpec Expectations 3.6](https://relishapp.com/rspec/rspec-expectations/docs);
    [Matchers](http://www.rubydoc.info/github/rspec/rspec-expectations/RSpec/Matchers#output-instance_method) – the `#output` matcher captures _stdout_ and _stderr_
    - [RSpec Mocks 3.6](https://relishapp.com/rspec/rspec-mocks/docs)


### Testowanie

1. Bill Wake, [3A – Arrange, Act, Assert](http://xp123.com/articles/3a-arrange-act-assert/) pattern; see also Sandi Metz [Setup, Do, Verify](https://www.sandimetz.com/99bottles/sample#_writing_the_first_test) and Robert C. Martin [Build, Operate, Check](https://helion.pl/ksiazki/czysty-kod-podrecznik-dobrego-programisty-robert-c-martin,czykov.htm), p. 147.
1. [RSpec Mocks 3.6](https://relishapp.com/rspec/rspec-mocks/v/3-6/docs/basics/scope).

Terminologia za Gerard Meszaros, _xUnit Test Patterns Refactoring Test Code_, Addison Wesley (2007).

* [Mocks, Fakes, Stubs and Dummies](http://xunitpatterns.com/Mocks,%20Fakes,%20Stubs%20and%20Dummies.html)
* [Test Double Patterns](http://xunitpatterns.com/Test%20Double%20Patterns.html)
  - [Test Double](http://xunitpatterns.com/Test%20Double.html) also known as *Imposter*
  - [Test Spy](http://xunitpatterns.com/Test%20Spy.html)
  - [Mock Object](http://xunitpatterns.com/Mock%20Object.html)
  - [Fake Object](http://xunitpatterns.com/Fake%20Object.html)
  - [Configurable Test Double](http://xunitpatterns.com/Configurable%20Test%20Double.html)
  - [Hard-Coded Test Double](http://xunitpatterns.com/Hard-Coded%20Test%20Double.html)


### Inne użyteczne rzeczy...

GitHub:

* [How GitHub Writes Blog Posts](https://zachholman.com/posts/how-github-writes-blog-posts/) by Zach Holman.

Ruby:

1. [Ruby Koans](http://rubykoans.com/) – Learn Ruby with the Neo Ruby Koans.
2. Jay Fields, Shane Harvie, Martin Fowler with Kent Beck.
  [Refactoring](http://books.google.pl/books/about/Refactoring.html?id=6jyOUrJBJHAC) – Ruby edition.
3. [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) – a community-driven Ruby coding style guide.
4. [Get the Lowdown on Ruby Modules](https://www.sitepoint.com/get-the-low-down-on-ruby-modules/).

Git:

* Jeff Geerling.
  [Why I close PRs (project maintainer notes)](http://www.jeffgeerling.com/blog/2016/why-i-close-prs-oss-project-maintainer-notes) – please make sure basic things like spacing, variable naming conventions, line endings, spaces instead of tabs, and the like follow the general style of the project
* Scott Chacon, Ben Straub. [Pro Git](https://git-scm.com/book/en/v2)
  - [6.1 GitHub – Account Setup and Configuration](https://git-scm.com/book/en/v2/GitHub-Account-Setup-and-Configuration)
  - [6.2 GitHub - Contributing to a Project](https://git-scm.com/book/en/v2/GitHub-Contributing-to-a-Project)
* [Git Tips](https://github.com/git-tips/tips) – most commonly used git tips and tricks
* [github-cheat-sheet](http://git.io/sheet)
* [Flight rules for Git](https://github.com/k88hudson/git-flight-rules) –
  what to do when things go wrong

Continuous Integration and Deployment:

1. [Travis](https://travis-ci.org/) – niestety usługa płatna dla repozytoriów prywatnych.
1. [Code Climate](https://codeclimate.com/) – healthy code ships faster.
  - [Deciphering Ruby Code Metrics](http://blog.codeclimate.com/blog/2013/08/07/deciphering-ruby-code-metrics/)

Użyteczne:

1. [Codility](https://codility.com/) – we test coders
1. [Mega Project List](https://github.com/karan/Projects) –
  a list of practical projects that anyone can solve in any programming language


[1]: https://github.com/elizabrock/NSS-Syllabus-Spring-2013
[2]: http://rvm.io/rvm
[3]: https://pragprog.com/book/rspec3/effective-testing-with-rspec-3
[4]: http://www.tutorialspoint.com/ruby/
[5]: http://learnxinyminutes.com/docs/ruby/
[6]: http://tryruby.org/levels/1/challenges/0
[7]: https://www.codeschool.com/courses/testing-with-rspec
[8]: https://github.com/colszowka/simplecov
