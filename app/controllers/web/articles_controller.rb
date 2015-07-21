class Web::ArticlesController < Web::ApplicationController
  before_filter :add_comment, only: :show

  def show
    @article = Article.find(params[:id]).decorate
    @article.increase_views
    @topic_articles = Article.same_articles(@article).last 3
    @strings = @article.tags.string
    @not_strings = @article.tags.events + @article.tags.activity_lines + @article.tags.teams
    @members = @article.tags.members.map &:target
    @popular_articles = ArticleDecorator.decorate_collection Article.popular.first 3
  end
end
