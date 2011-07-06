fichier_log = "production.log"
avec_debug = true
ip_a_filtrer = "10.2.12.99"
production = `cat #{fichier_log}`
production.split(/Processing/).each do |entree|
	leslignes = entree.split(/\n\[/)
	if (leslignes[0].split(/\s/)[3]== ip_a_filtrer) 
		i=0
		leslignes.each do |laligne|
			if (i==0)
				puts "Processing#{laligne}"
			else
				if (avec_debug or laligne.split(/\|/)[0] != "DEBU")
					puts "[#{laligne}"
				end
			end
			i+=1
		end
	end 
end
