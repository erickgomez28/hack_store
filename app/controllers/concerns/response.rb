module Response
	def response_format(objet)
		respond_to do |format|
		  	format.html# index.html.erb
		  	format.json { render json: objet}
		end
	end
end
