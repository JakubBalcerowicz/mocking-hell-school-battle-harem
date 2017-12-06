![alt text](https://i.imgur.com/OykAoy5.png "He protec but he also rspec")

# Projekt zespołowy "Testowanie aplikacji Ruby" Informatyka Rok III

#### Prowadzący - dr [Włodzimierz Bzyl](https://github.com/wbzyl)

#### Członkowie grupy

 - [Piotr Aszkielaniec](github.com/readher)
 - [Szymon Cimochowski](github.com/Rilok)
 - [Jakub Balcerowicz](github.com/JakubBalcerowicz)

|Travis CI   |Maintainability   |Test Coverage   |
|:-:|:-:|:-:|
|[![Build Status](https://travis-ci.org/my-rspec/mocking-hell-school-battle-harem.svg?branch=master)](https://travis-ci.org/my-rspec/mocking-hell-school-battle-harem)   |[![Maintainability](https://api.codeclimate.com/v1/badges/7ee8a9d2aa69693fef05/maintainability)](https://codeclimate.com/github/my-rspec/mocking-hell-school-battle-harem/maintainability)   |[![Test Coverage](https://api.codeclimate.com/v1/badges/7ee8a9d2aa69693fef05/test_coverage)](https://codeclimate.com/github/my-rspec/mocking-hell-school-battle-harem/test_coverage)|

#### Temat Projektu

### :new: Konfiguracja usługi Code Climate

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
  - Tworzymy plik _.travis.yml_ o treści:

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
  - Kopiujemy _TEST REPORTER ID_ i wklejamy w miejsce tekstu w pliku _.travis.yml_.
3. W katalogu _lib_ umieszczamy plik źródłowy programu testowego.
4. W katalogu _spec_ tworzymy plik _spec_helper.rb_ o treści:

 ```yml
 require 'simplecov'
 SimpleCov.start

 require_relative '../lib/test'
 ```
5. Do katalogu _spec_ wklejamy plik z testem/testami rspec programu testowego i na jego początku umieszczamy wyłącznie _require 'spec_helper'_ (nie umieszczamy wymogu pliku źródłowego programu testowego).
6. Po dokonaniu zmian w repozytorium i wykonaniu builda przez Travisa, Code Climate powinien otrzymać od Travisa raport i umieścić statystyki na temat _Test coverage_ na stronie naszego repozytorium na _codeclimate.com_. W celu umieszczenia odnośników do statusu w naszym README.md na GitHubie, wchodzimy w _Settings_ a następnie _Badges_, wybieramy Markdown i umieszczamy kod w naszym Readme (z jakiegoś powodu czasem zamiast obrazka tworzy się zwykłe hiperłącze).
7. Naturalnie gdy zaczniemy już robić projekt, nazwy plików (_test.rb_, _test_spec.rb_) ulegną zmianie i można je przemianować, a jeśli zajdzie potrzeba, możemy dodać kolejne gemy do pliku Gemfile. Należy jednak pamiętać o zachowaniu metodologii (dodawanie relatives do _spec_helper.rb_ i umieszczanie _require 'spec_helper'_ na początku plików z testami). Kluczowe jest też to, aby w pliku _spec_helper.rb_ na początlu zawsze znajdowało się

 ```yml
 require 'simplecov'
 SimpleCov.start
 ```

W przeciwnym wypadku funkcja badająca kod nie prześledzi testów i raport się nie wygeneruje lub będzie błędny.
