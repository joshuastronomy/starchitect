# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_170_830_002_350) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'activities', id: :serial, force: :cascade do |t|
    t.integer 'user_id'
    t.string 'action'
    t.string 'trackable_type'
    t.integer 'trackable_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index ['trackable_id'], name: 'index_activities_on_trackable_id'
    t.index ['user_id'], name: 'index_activities_on_user_id'
  end

  create_table 'badges_sashes', force: :cascade do |t|
    t.integer 'badge_id'
    t.integer 'sash_id'
    t.boolean 'notified_user', default: false
    t.datetime 'created_at'
    t.index %w[badge_id sash_id], name: 'index_badges_sashes_on_badge_id_and_sash_id'
    t.index ['badge_id'], name: 'index_badges_sashes_on_badge_id'
    t.index ['sash_id'], name: 'index_badges_sashes_on_sash_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'body'
    t.bigint 'user_id'
    t.string 'commentable_type'
    t.bigint 'commentable_id'
    t.index %w[commentable_type commentable_id], name: 'index_comments_on_commentable_type_and_commentable_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'merit_actions', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'action_method'
    t.integer 'action_value'
    t.boolean 'had_errors', default: false
    t.string 'target_model'
    t.integer 'target_id'
    t.text 'target_data'
    t.boolean 'processed', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'merit_activity_logs', force: :cascade do |t|
    t.integer 'action_id'
    t.string 'related_change_type'
    t.integer 'related_change_id'
    t.string 'description'
    t.datetime 'created_at'
  end

  create_table 'merit_score_points', force: :cascade do |t|
    t.bigint 'score_id'
    t.integer 'num_points', default: 0
    t.string 'log'
    t.datetime 'created_at'
    t.index ['score_id'], name: 'index_merit_score_points_on_score_id'
  end

  create_table 'merit_scores', force: :cascade do |t|
    t.bigint 'sash_id'
    t.string 'category', default: 'default'
    t.index ['sash_id'], name: 'index_merit_scores_on_sash_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'sashes', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'submissions', force: :cascade do |t|
    t.string 'submit_type'
    t.string 'title'
    t.text 'body'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'submit_object'
    t.index ['user_id'], name: 'index_submissions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'firstname'
    t.string 'lastname'
    t.string 'callsign'
    t.string 'password_digest'
    t.boolean 'admin', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email'
    t.string 'rank', default: 'Cadet'
    t.string 'api_token'
    t.string 'beacons', default: [], array: true
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.integer 'sash_id'
    t.integer 'level', default: 0
    t.index ['api_token'], name: 'index_users_on_api_token', unique: true
  end

  add_foreign_key 'activities', 'users', on_delete: :cascade
  add_foreign_key 'comments', 'users'
  add_foreign_key 'posts', 'users'
  add_foreign_key 'submissions', 'users', on_delete: :cascade
end
