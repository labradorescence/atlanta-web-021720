require_relative './config/environment'

run ApplicationController
use FriendsController
use ConversationsController
