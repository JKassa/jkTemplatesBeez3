<div id="reviewPost{{ review_id }}" class="article-info">
	<!--Img-->
	<span class="pull-left" style="margin-right: 10px;">
		<img src="{{ user_img }}" alt="{{ user_name }}" style="width: 64px; height: 64px;">
	</span>
	<div style="overflow: hidden;">
		<!--Name / Rating / Date-->
		<h4>
			{{ user_name }}
			{% if rating %}
				{% if rating > 0 %}
				  {{ 'image' | jhtml: 'system/rating_star.png', 'vote-1', 'style="width: 10px"', 1 }}
				{% else %}
				  {{ 'image' | jhtml: 'system/rating_star_blank.png', 'vote-1', 'style="width: 10px"', 1 }}
				{% endif %}
				{% if rating > 1 %}
				  {{ 'image' | jhtml: 'system/rating_star.png', 'vote-2', 'style="width: 10px"', 1 }}
				{% else %}
				  {{ 'image' | jhtml: 'system/rating_star_blank.png', 'vote-2', 'style="width: 10px"', 1 }}
				{% endif %}
				{% if rating > 2 %}
				  {{ 'image' | jhtml: 'system/rating_star.png', 'vote-3', 'style="width: 10px"', 1 }}
				{% else %}
				  {{ 'image' | jhtml: 'system/rating_star_blank.png', 'vote-3', 'style="width: 10px"', 1 }}
				{% endif %}
				{% if rating > 3 %}
				  {{ 'image' | jhtml: 'system/rating_star.png', 'vote-4', 'style="width: 10px"', 1 }}
				{% else %}
				  {{ 'image' | jhtml: 'system/rating_star_blank.png', 'vote-4', 'style="width: 10px"', 1 }}
				{% endif %}
				{% if rating > 5 %}
				  {{ 'image' | jhtml: 'system/rating_star.png', 'vote-5', 'style="width: 10px"', 1 }}
				{% else %}
				  {{ 'image' | jhtml: 'system/rating_star_blank.png', 'vote-5', 'style="width: 10px"', 1 }}
				{% endif %}
			{% endif %}
			<small class="pull-right">
			  {{ date }}
			</small>
		</h4>
		<!--Review-->
		<div>
			{% if message %}
			<p>
				{{ message }}
			</p>
			{% endif %}
			<p>{{ review }}</p>
			{% if dignity %}
			<div><strong>{{ '_' | jtext: 'COM_JKASSA_REVIEWS_DIGNITY' }}:</strong> {{ dignity }}</div>
			{% endif %}
			{% if shortcomings %}
			<div><strong>{{ '_' | jtext: 'COM_JKASSA_REVIEWS_SHORTCOMINGS' }}:</strong> {{ shortcomings }}</div>
			{% endif %}
		</div>
		<!--Toolbar-->
		<div class="items-row cols-2">
			<div class="item column-1" style="padding: 10px 0 0;">
				{% if parent == 0 and access_reply != 1 %}
				<a href="#" data-click="show-reply" data-id="{{ review_id }}" class="button">
					{{ '_' | jtext: 'COM_JKASSA_REVIEWS_REPLY' }}
				</a>
				{% endif %}
			</div>
			<div class="item column-2 text-right" style="padding: 10px 0 0;">
				<!--Rating-->
				{% if parent == 0 %}
				<a href="#" data-click="reviews-rating" data-rating="1" data-id="{{ review_id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_HELPFUL' }}">
					+
				</a>
				<span id="reviewRating{{ review_id }}" class="label">
					{{ review_rating }}
				</span>
				<a href="#" data-click="reviews-rating" data-rating="-1" data-id="{{ review_id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_NOT_HELPFUL' }}">
					&minus;
				</a>
				{% endif %}
				{% if access_report != 1 %}
				<!--Report-->
				&nbsp;&nbsp;&nbsp;
				<a href="#" data-click="show-report" data-id="{{ review_id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_REPORT_TITLE' }}">
					&nbsp;!&nbsp;
				</a>
				{% endif %}
			</div>
		</div>
		{% if parent == 0 and access_reply != 1 %}
		<!--Reply form-->
		<div id="reviewReplyBlock{{ review_id }}" style="display: none">
			<form id="reviewReplyForm{{ review_id }}">
				<fieldset>
					<p>
						<label for="reviewReplyReview">{{ '_' | jtext: 'MESSAGE' }}</label><br>
						<textarea id="reviewReview" name="reviewReview"></textarea>
					</p>
					<p>
						<label for="reviewReplyName">{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}</label><br>
						{% if reply_name %}{% assign readonly_name = ' readonly' %}{% endif %}
						<input type="text" id="reviewReplyName" name="reviewName" value="{{ reply_name }}"{{ readonly_name }}>
					</p>
					<p>
						<label for="reviewReplyEmail">{{ '_' | jtext: 'COM_JKASSA_YOUR_EMAIL' }}</label><br>
						{% if reply_email %}{% assign readonly_email = ' readonly' %}{% endif %}
						<input type="email" id="reviewReplyEmail" name="reviewEmail" value="{{ reply_email }}"{{ readonly_email }}>
					</p>
					<a href="#" class="button" data-click="send-reply" data-id="{{ review_id }}" data-toadd="> div">
						{{ '_' | jtext: 'JSUBMIT' }}
					</a>
					<input type="hidden" name="productID" value="{{ product_id }}">
				</fieldset>
			</form>
		</div>
		{% endif %}
		{% if access_report != 1 %}
		<!--Report form-->
		<div id="reviewReportBlock{{ review_id }}" style="display: none">
			<form id="reviewReportForm{{ review_id }}">
				<fieldset>
					<p>
						<label for="reviewReport">{{ '_' | jtext: 'MESSAGE' }}</label><br>
						<textarea id="reviewReport" name="reviewReport"></textarea>
					</p>
					<p>
						<label for="reviewReportName">{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}</label><br>
						{% if reply_name %}{% assign readonly_name = ' readonly' %}{% endif %}
						<input type="text" id="reviewReportName" name="reviewName" value="{{ reply_name }}"{{ readonly_name }}>
					</p>
					<p>
						<label for="reviewReportEmail">{{ '_' | jtext: 'COM_JKASSA_YOUR_EMAIL' }}</label><br>
						{% if reply_email %}{% assign readonly_email = ' readonly' %}{% endif %}
						<input type="email" id="reviewReportEmail" name="reviewEmail" value="{{ reply_email }}"{{ readonly_email }}>
					</p>
					<a href="#" class="button" data-click="send-report" data-id="{{ review_id }}">
						{{ '_' | jtext: 'JSUBMIT' }}
					</a>
					<input type="hidden" name="productID" value="{{ product_id }}">
				</fieldset>
			</form>
		</div>
		{% endif %}
		<!--Children-->
		{% if children %}
		  {{ children }}
		{% endif %}
	</div>
</div>