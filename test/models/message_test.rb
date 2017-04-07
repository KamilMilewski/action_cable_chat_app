require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = users(:example).messages.build(content: "Lorem ipsum")
    @user1 = users(:example)
    @fixture_user = users(:fixture_user)
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test "should find mentioned users" do
    message_with_mention = users(:example).messages
      .build(content: "Hey, @fixture_user, I'm talking to you!!!")
    assert message_with_mention.mentions.include?(@fixture_user)
  end
end
