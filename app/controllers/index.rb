get '/' do
  # Look in app/views/index.erb
  @articles = Article.all
  erb :index
end

get '/account' do
 @user_articles = Article.where(user_id: session[:id])
 erb :account
end

post '/posts/new' do
  Article.create(user_id: session[:id], content: params[:content], votes: 0)
  redirect '/'
end


get '/posts/:id' do
  @article = Article.find(params[:id])
  erb :article
end

post '/users/new' do
  User.create(name: params[:name])
  session[:id] = User.last.id
  redirect '/'
end

post '/users/sign_in' do
  @user = User.find_by(name: params[:name])
  session[:id] = @user.id
  redirect '/'
end

get '/user/sign_out' do
  session[:id] = nil
  redirect '/'
end

post '/posts/:id/vote/up' do
  @article_vote = Article.find(params[:id])
  new_vote = (@article_vote.votes += 1)
  @article_vote.update_attributes(:votes => new_vote)
  redirect '/'
end

post '/posts/:id/vote/down' do
  @article_vote = Article.find(params[:id])
  new_vote = (@article_vote.votes -= 1)
  @article_vote.update_attributes(:votes => new_vote)
  redirect '/'
end

post '/posts/:id/edit' do
  @article_edit = Article.find(params[:id])
  @article_edit.update_attributes(:content => params[:content])
  redirect '/'
end

delete '/posts/:id/delete' do
  Article.delete(params[:id])
  redirect '/'
end
