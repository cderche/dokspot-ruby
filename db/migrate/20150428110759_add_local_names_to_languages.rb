class AddLocalNamesToLanguages < ActiveRecord::Migration
  def self.up
  	languages = [
  		{ name: "Bulgarian", local: "български" },
  		{ name: "Croatian", local: "Hrvatski" },
  		{ name: "Czech", local: "čeština" },
  		{ name: "Danish", local: "Dansk" },
  		{ name: "Dutch", local: "Nederlands" },
  		{ name: "English", local: "English" },
  		{ name: "Estonian", local: "eesti keel" },
  		{ name: "Finnish", local: "Suomi" },
  		{ name: "French", local: "Français" },
  		{ name: "German", local: "Deutsch" },
  		{ name: "Greek", local: "ελληνικά" },
  		{ name: "Hungarian", local: "magyar" },
  		{ name: "Irish", local: "Gaeilge" },
  		{ name: "Italian", local: "italiano" },
  		{ name: "Latvian", local: "latviešu valoda" },
  		{ name: "Lithuanian", local: "lietuvių kalba" },
  		{ name: "Maltese", local: "Malti" },
  		{ name: "Polish", local: "polski" },
  		{ name: "Portuguese", local: "português" },
  		{ name: "Romanian", local: "român" },
  		{ name: "Slovak", local: "slovenčina" },
  		{ name: "Slovene", local: "slovenščina" },
  		{ name: "Spanish", local: "español" },
  		{ name: "Swedish", local: "Svenska" },
  		{ name: "Chinese (Mandarin)", local: "普通話" },
  		{ name: "Japanese", local: "日本語" },
  		{ name: "Korean", local: "한국어" },
  		{ name: "Russian", local: "Русский" }
  	]

  	languages.each do |l|
  		tmp = Language.find_by(name: l[:name])
      if tmp
        tmp.update(local: l[:local])
        puts "updated"
      else
        Language.create(l)
        puts "created"
      end
  	end

  end

  def self.down
  	Language.each do |l|
  		l.update(local: nil)
  	end
  end
end
