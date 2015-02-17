# encoding: utf-8
#
# This file is a part of Redmine per project formatting plugin
#
# @author Strnadj <jan.strnadek@gmail.com>

require File.expand_path('../../test_helper', __FILE__)

class EditorSettingsTest < ActionController::TestCase
  tests ::ProjectsController
  fixtures :projects, :versions, :users, :roles, :members,
           :member_roles, :issues, :journals, :journal_details,
           :trackers, :projects_trackers, :issue_statuses,
           :enabled_modules, :enumerations, :boards, :messages,
           :attachments, :custom_fields, :custom_values, :time_entries

  def setup
    @request.session[:user_id] = 2
    Setting.default_language = 'en'
  end

  def test_settings_present
    get :settings, :id => 1
    assert_select 'input#project_wide_formatting'
    assert_select 'select#project_text_formatting' do
      assert_select 'option', Redmine::WikiFormatting.format_names.count + 1
    end
  end

  def test_textile_formatter
    Project.find(1).update_attributes(text_formatting: 'textile')
    get :settings, :id => 1

    # Test presence of jstoolbar/textile js!
    scripts = css_select("script[src]")
    found_script = nil

    scripts.each do |script|
      if script['src'].include? 'jstoolbar-textile'
        found_script = script
      end
    end

    assert_not_nil found_script
  end

  def test_markdown_formatter
    Project.find(1).update_attributes(text_formatting: 'markdown')
    get :settings, :id => 1

    # Test presence of jstoolbar/markdown js!
    scripts = css_select("script[src]")
    found_script = nil

    scripts.each do |script|
      if script['src'].include? 'jstoolbar/markdown'
        found_script = script
      end
    end

    assert_not_nil found_script
  end
end
