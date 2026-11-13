# Be sure to restart your server when you modify this file.
#
# Regras de pluralização e singularização para português do Brasil.
#
# As regras são aplicadas em dois locales:
#   - :"pt-BR" -> para chamadas explícitas, ex.: "carro".pluralize(:"pt-BR")
#   - :en      -> o locale que o Rails usa por padrão para nomes de tabelas,
#                 rotas, generators etc. (Carro -> tabela "carros")
#
# O Rails avalia as regras da ÚLTIMA definida para a PRIMEIRA, por isso as
# regras genéricas vêm antes e as mais específicas depois.

[:"pt-BR", :en].each do |locale|
  ActiveSupport::Inflector.inflections(locale) do |inflect|
    inflect.clear

    #---------------------------------------------------------------
    # Plural
    # ---------------------------------------------------------------
    inflect.plural(/$/, "s")                     # carro    -> carros
    inflect.plural(/(s)$/i, '\1')                # (palavras terminadas em "s" sem regra própria)
    inflect.plural(/^(paí)s$/i, '\1ses')         # país     -> países
    inflect.plural(/(z|r)$/i, '\1es')            # cor      -> cores, luz -> luzes
    inflect.plural(/al$/i, "ais")                # animal   -> animais
    inflect.plural(/el$/i, "eis")                # papel    -> papeis
    inflect.plural(/ol$/i, "ois")                # farol    -> farois
    inflect.plural(/ul$/i, "uis")                # azul     -> azuis
    inflect.plural(/il$/i, "is")                 # barril   -> barris
    inflect.plural(/m$/i, "ns")                  # item     -> itens
    inflect.plural(/^(japon|escoc|ingl|dinamarqu|fregu|portugu)ês$/i, '\1eses') # inglês -> ingleses
    inflect.plural(/ão$/i, "ões")                # botão    -> botões

    # ---------------------------------------------------------------
    # Singular
    # ---------------------------------------------------------------
    inflect.singular(/s$/i, "")                  # carros   -> carro
    inflect.singular(/^(paí)ses$/i, '\1s')       # países   -> país
    inflect.singular(/(r|z)es$/i, '\1')          # cores    -> cor, luzes -> luz
    inflect.singular(/is$/i, "il")               # barris   -> barril
    inflect.singular(/ais$/i, "al")              # animais  -> animal
    inflect.singular(/eis$/i, "el")              # papeis   -> papel
    inflect.singular(/ois$/i, "ol")              # farois   -> farol
    inflect.singular(/uis$/i, "ul")              # azuis    -> azul
    inflect.singular(/ns$/i, "m")                # itens    -> item
    inflect.singular(/^(japon|escoc|ingl|dinamarqu|fregu|portugu)eses$/i, '\1ês') # ingleses -> inglês
    inflect.singular(/ões$/i, "ão")              # botões   -> botão
    inflect.singular(/ães$/i, "ão")              # pães     -> pão
    inflect.singular(/ãos$/i, "ão")              # mãos     -> mão

    # ---------------------------------------------------------------
    # Irregulares
    #
    # Não usamos inflect.irregular porque ele não ancora no início da
    # palavra: "mal" -> "males" também transformaria "animal" em "animales".
    # Aqui as regras valem só para a palavra inteira (^...$).
    # ---------------------------------------------------------------
    {
      "cão"      => "cães",
      "pão"      => "pães",
      "mão"      => "mãos",
      "alemão"   => "alemães",
      "capitão"  => "capitães",
      "irmão"    => "irmãos",
      "cidadão"  => "cidadãos",
      "cristão"  => "cristãos",
      "órgão"    => "órgãos",
      "mal"      => "males",
      "cônsul"   => "cônsules",
      "fóssil"   => "fósseis",
      "réptil"   => "répteis",
      "projétil" => "projéteis"
    }.each do |singular, plural|
      inflect.plural(/^#{singular}$/i, plural)
      inflect.singular(/^#{plural}$/i, singular)
    end

    # ---------------------------------------------------------------
    # Invariáveis (mesma forma no singular e no plural)
    # ---------------------------------------------------------------
    inflect.uncountable %w[tórax tênis ônibus lápis vírus atlas pires óculos férias parabéns]
  end
end
