### :new: Konfiguracja usługi Code Code Climate

1. Logujemy się na _codeclimate.com_, gdzie autoryzujemy konto z GitHub.
  - Wybieram kategorię _Open Source_.
  - Klikamy dwa razy na opcję _Add Repo_ obok naszego repozytorium mocking-hell.
  - W przypadku repozytoriów publicznych, Code Climate jest już zintegrowany i nie musimy łączyć żadnych tokenów.
2. W celu wykonania dalszej konfiguracji, która polega na zaimplementowaniu _Test Coverage_ potrzebny jest program testowy. Sugeruję skopiować jeden z CodeQuizzes.
 - W naszym repozytorium mocking-hell wprowadzamy porządek folderów znany nam z hello-rsepc (lib, spec).
 - Tworzymy plik Gemfile o treści:

 ```yml
  source 'https://rubygems.org'

  gem 'rspec', :require => false, :group => :test
  gem 'simplecov', :require => false, :group => :test
 ```
  - Tworzymy plik .travis.yml o treści:

  ```yml
  env:
  global:
    - CC_TEST_REPORTER_ID=TEST_REPORTER_ID
  language: ruby
  rvm:
    - 2.4
  before_script:
    - curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter
    - chmod +x ./cc-test-reporter
    - ./cc-test-reporter before-build
  script:
    - bundle install; rspec spec --format documentation
  after_script:
    - ./cc-test-reporter after-build --exit-code $TRAVIS_TEST_RESULT
 ```
  - Wchodzimy w nasze repozytorium na _codeclimate.com_.
  - Klikamy na _Settings_ a następnie _Test coverage_.
  - Zostawiamy zakładkę otwartą gdyż za chwile będzie nam potrzebny _TEST REPORTER ID_.
  - Kopiujemy _TEST REPORTER ID_ i kopiujemy w miejsce tekstu w pliku _.travis.yml_.
3. W katalogu _lib_ umieszczamy plik źródłowy programu testowego.
4. W katalogu _spec_ tworzymy plik spec_helper.rb o treści:

 ```yml
 require 'simplecov'
 SimpleCov.start

 require_relative '../lib/test'
 ```
5. Do katalogu _spec_ wklejamy plik z testem/testami rspec programu testowego i na jego początku umieszczamy wyłącznie _require 'spec_helper'_ (nie umieszczamy wymogu pliku źródłowego programu testowego).
6. Po dokonaniu zmian w repozytorium i wykonaniu builda przez Travisa, Code Climate powinien otrzymać od Travisa raport i umieścić statystyki na temat maintainability oraz test coverage na stronie naszego repozytorium na _codeclimate.com_. W celu umieszczenia odnośników do statusu w naszym README.md na GitHubie, wchodzimy w _Settings_ a następnie _Badges_, wybieramy Markdown i umieszczamy kod w naszym Readme (z jakiegoś powodu czasem zamiast obrazka tworzy się zwykłe hiperłącze).
