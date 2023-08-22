# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

until Aventure.count == 20 do
    Aventure.create(name: Faker::Mountain.name) if !Aventure.pluck(:name).include?(Faker::Mountain.name)
end

aventures = Aventure.all

until Article.count == 50 do
    Article.create(title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), when_went:
    Faker::Date.between(from: 05.years.ago, to: Date.today), aventure_id:
    aventures.sample.id)
    end

    articles = Article.all
    catusers = CatUser.all

    untill Cat_Comment.count == 100 do
        Cat_Comment.create(content : Faker::Lorem.paragraph_by_chars(number:100,supplwmwntal: false), article_id: articles.sample.id, catuser_id: users.sample.id)
        
    end

    r_type = %w[article cat_comment]
catcomments = Cat_Comment.all
kinds = Article::Kinds
until Reaction.count == 100 do
rel_type = r_type.sample
if rel_type == "article"
Reaction.create(article_id: articles.sample.id, catuser_id:
catusers.sample.id, kind: kinds.sample, reaction_type: rel_type)
else
Reaction.create(cat_comment_id: catcomments.sample.id, catuser_id:
catusers.sample.id, kind: kinds.sample, reaction_type: rel_type)
end
end