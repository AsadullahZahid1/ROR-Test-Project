import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import  'jquery';
import './custom'
global.$ = jQuery;
import  'stylesheets/application';
import 'bootstrap';