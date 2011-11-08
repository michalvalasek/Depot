#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Product.delete_all
Product.create(:title => 'Profesionální webdesign',
  :description => 
    %{<p>
        Prostřednictvím praktických projektů, modelových designů a 
        7 komplexních vzorových řešení vám zkušený odborník představí jak základní, 
        tak i promyšlenější koncepty designu, které vám umožní tvořit profesionálně 
        vypadající weby pomocí nejnovějších technologií a technik. 
        Jednotlivé přístupy jsou ilustrovány modelovými weby, 
        jejichž zdrojové a grafické soubory naleznete k volnému použití na CD. 
        Z knihy tak můžete čerpat nejen poučení a zdokonalení v tvůrčích technikách, 
        ale i vydatnou inspiraci, nebo hotová řešení od webových profesionálů rovnou 
        použít ve svých projektech.
      </p>},
  :image_url =>   '/assets/pwd.jpg',    
  :price => 587)
# . . .
Product.create(:title => 'Začínáme programovat v Ruby on Rails',
  :description =>
    %{<p>
        Ruby on Rails je revoluční programovací nástroj, 
        jenž urychluje a zjednodušuje tvorbu webových stránek a jejich aplikací. 
        Díky zapojení přímočarého jazyka Ruby a vývojové platformy, kterou poskytuje Rails, 
        můžete ve velmi krátkém čase vytvořit plnohodnotné webové aplikace, 
        i když nejste zkušenými programátory.
      </p>},
  :image_url => '/assets/zprr.jpg',
  :price => 337)
# . . .

Product.create(:title => 'jQuery, Kuchařka programátora',
  :description => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :image_url => '/assets/jqkp.jpg',
  :price => 502)
