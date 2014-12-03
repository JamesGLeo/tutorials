# index
get "/artists" do
  @artists = Artist.all
  erb(:"artists/index")
end

# new
get "/artists/new" do
  erb(:"artists/new")
end

# create
post "/artists" do
  @artist = Artist.create!(params[:artist])
  redirect("/artists/#{@artist.id}")
end

#show
get "/artists/:id" do
  @artist = Artist.find(params[:id])
  erb(:"artists/show")
end

# edit
get "/artists/:id/edit" do
  @artist = Artist.find(params[:id])
  erb(:"artists/edit")
end

# update
put "/artists/:id" do
  @artist = Artist.update!(params[:artist])
  redirect("/artists/#{@artist.id}")
end

# destroy
post "/artists/:id/delete" do
  @artist = Artist.find(params[:id])
  erb(:"artists/index")
end
