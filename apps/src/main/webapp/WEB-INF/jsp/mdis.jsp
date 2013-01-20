<%@include file="header.jsp"%>
<h3>Market data instruments</h3>
<p>
	<i>Search will search through MDI key values. Use SQL like
		wild cards.</i>
</p>
<div class="input-append">
	<form>
		<input
			class="span2" style="width: 500px;" id="appendedInputButton"
			name="searchString" type="text" value="${searchString}" />
		<button type="submit" class="btn btn-primary">Search!</button>
	</form>
</div>

<table>
<c:forEach var="e" items="${entries}">
	<tr>
		<td><a href="mdi?mdiid=${e}">${e}</a></td>
	</tr>
</c:forEach>
</table>



<hr />
<%@include file="footer.jsp"%>