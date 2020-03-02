<form action="{{ form_action }}" method="post" id="login-form">
    <fieldset class="userdata">
        <!--User name-->
        <p>
            <label for="modjku-username">{{ '_' | jtext: 'JGLOBAL_USERNAME' }}</label>
            <input id="modjku-username" type="text" name="username" class="inputbox" tabindex="0" size="18" />
        </p>
        <!--Password-->
        <p>
            <label for="modjku-passwd">{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}</label>
            <input id="modjku-passwd" type="password" name="password" class="inputbox" tabindex="0" size="18" />
        </p>
        {% if twoFactorMethods %}
        <!--Secret key-->
        <p>
            <label for="modjku-secretkey">{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}</label>
            <input id="modjku-secretkey" autocomplete="off" type="text" name="secretkey" class="inputbox" tabindex="0" size="18" />
        </p>
        {% endif %}
        {% if remember %}
        <!--Remember-->
        <p style="overflow: hidden; margin-bottom: 10px;">
            <label for="modjku-remember" style="display: inline; margin-left: 10px;">{{ '_' | jtext: 'JGLOBAL_REMEMBER_ME' }}</label>
            <input id="modjku-remember" type="checkbox" name="remember" class="inputbox" value="yes" style="float: left;" />
        </p>
        {% endif %}
        <!--Submit-->
        <input type="submit" name="Submit" class="button" value="{{ '_' | jtext: 'JLOGIN' }}" />
    </fieldset>
	<input type="hidden" name="option" value="com_users" />
	<input type="hidden" name="task" value="user.login" />
	<input type="hidden" name="return" value="{{ return }}" />
	{{ token }}
</form>