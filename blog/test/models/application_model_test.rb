# frozen_string_literal: true

require "test_helper"

module Blog
  class ApplicationModelTest < ActiveSupport::TestCase
    test "is an active model" do
      assert_operator(ActiveModel::Model, :in?, ApplicationModel.included_modules)
    end

    test "after_initialize" do
      model_class = new_model_class do
        attr_accessor(:initialized)
        after_initialize { self.initialized = true }
      end

      assert_predicate(model_class.new, :initialized)
    end

    test "attributes initialize" do
      model_class = new_model_class do
        attributes(:a, :b, :c)
      end

      model = model_class.new(a: "foo", b: "bar", c: "baz")

      assert_equal(%w(foo bar baz), [model.a, model.b, model.c])
    end

    test "attributes accessors" do
      model_class = new_model_class do
        attributes(:status)
      end

      model = model_class.new

      model.status = "active"

      assert_equal("active", model.status)
    end

    test "#attributes" do
      user_class = new_model_class do
        attributes(:first_name, :last_name)
      end

      user = user_class.new(first_name: "Peter", last_name: "Parker")

      assert_equal({ first_name: "Peter", last_name: "Parker" }, user.attributes)
    end

    test "#== compares attributes" do
      comment_class = new_model_class do
        attributes(:content, :approved)
      end

      comment = comment_class.new(content: "Hello World", approved: true)
      other_comment = comment_class.new(content: "Hello World", approved: true)

      assert_equal(comment, other_comment)
    end

    private

    def new_model_class(&block)
      Class.new(ApplicationModel, &block)
    end
  end
end