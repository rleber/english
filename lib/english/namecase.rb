require 'english/class'

class English

  # Returns a new +String+ with the contents properly namecased.
  #
  # Perl Version Copyright (c) Mark Summerfield 1998-2002
  # <summer@perlpress.com>
  #
  # Ruby Version Copyright (c) Aaron Patterson 2006

  def self.namecase(name)
    localstring = name.downcase
    localstring.gsub!(/\b\w/) { |first| first.upcase }
    localstring.gsub!(/\'\w\b/) { |c| c.downcase } # Lowercase 's

    # Fixes for "Mac".
    if localstring =~ /\bMac[A-Za-z]{2,}[^aciozj]\b/ or localstring =~ /\bMc/
      localstring.gsub!(/\b(Ma?c)([A-Za-z]+)/) { |match| $1 + $2.capitalize }
      localstring.gsub!(/\bMacEvicius/, 'Macevicius')
      localstring.gsub!(/\bMacHado/, 'Machado')
      localstring.gsub!(/\bMacHar/, 'Machar')
      localstring.gsub!(/\bMacHin/, 'Machin')
      localstring.gsub!(/\bMacHlin/, 'Machlin')
      localstring.gsub!(/\bMacIas/, 'Macias')
      localstring.gsub!(/\bMacIulis/, 'Maciulis')
      localstring.gsub!(/\bMacKie/, 'Mackie')
      localstring.gsub!(/\bMacKle/, 'Mackle')
      localstring.gsub!(/\bMacKlin/, 'Macklin')
      localstring.gsub!(/\bMacQuarie/, 'Macquarie')
    end
    localstring.gsub!('Macmurdo','MacMurdo')

    # Fixes for "son (daughter) of" etc.
    localstring.gsub!(/\bAl(?=\s+\w)/, 'al')      # al Arabic or forename Al.
    localstring.gsub!(/\bAp\b/, 'ap')             # ap Welsh.
    localstring.gsub!(/\bBen(?=\s+\w)/,'ben')     # ben Hebrew or forename Ben.
    localstring.gsub!(/\bDell([ae])\b/,'dell\1')  # della and delle Italian.
    localstring.gsub!(/\bD([aeiu])\b/,'d\1')      # da, de, di Italian; du French.
    localstring.gsub!(/\bDe([lr])\b/,'de\1')      # del Italian; der Dutch/Flemish.
    localstring.gsub!(/\bEl\b/,'el')              # el Greek or El Spanish.
    localstring.gsub!(/\bLa\b/,'la')              # la French or La Spanish.
    localstring.gsub!(/\bL([eo])\b/,'l\1')        # lo Italian; le French.
    localstring.gsub!(/\bVan(?=\s+\w)/,'van')     # van German or forename Van.
    localstring.gsub!(/\bVon\b/,'von')            # von Dutch/Flemish

    # Fix roman numeral names
    localstring.gsub!(
      / \b ( (?: [Xx]{1,3} | [Xx][Ll]   | [Ll][Xx]{0,3} )?
             (?: [Ii]{1,3} | [Ii][VvXx] | [Vv][Ii]{0,3} )? ) \b /x
    ) { |match| match.upcase }

    localstring
  end

  # Returns a new +String+ with the contents properly namecased.
  def namecase
    self.class.namecase(@self)
  end

end

