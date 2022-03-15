<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<script>
	$('#classData').on('select_node.jstree', function(e, data) {
		if (data.event) {
			data.instance.select_node(data.node.children_d);
		}
	}).on('deselect_node.jstree', function(e, data) {
		if (data.event) {
			data.instance.deselect_node(data.node.children_d);
			data.instance.close_node(data.node.id);
		}
	}).jstree({
		'core' : {
			'data' : {
				'url' : 'orderClassList.do'
			}

		},

		"plugins" : [ "massload", "wholerow", "checkbox", "sort", "search" ]
	});

	$('#favData').on('select_node.jstree', function(e, data) {
		if (data.event) {
			data.instance.select_node(data.node.children_d);
		}
	}).on('deselect_node.jstree', function(e, data) {
		if (data.event) {
			data.instance.deselect_node(data.node.children_d);
			data.instance.close_node(data.node.id);
		}
	}).jstree({
		'core' : {
			'data' : {
				'url' : 'orderFavList.do'
			}
		},

		"plugins" : [ "massload", "wholerow", "checkbox", "sort", "search" ]
	});

	$('#employeeData').on('select_node.jstree', function(e, data) {
		if (data.event) {
			data.instance.select_node(data.node.children_d);
		}
	}).on('deselect_node.jstree', function(e, data) {
		if (data.event) {
			data.instance.deselect_node(data.node.children_d);
			data.instance.close_node(data.node.id);
		}
	}).jstree({
		'core' : {
			'data' : {
				'url' : 'orderMemList.do'
			}
		},

		"plugins" : [ "massload", "wholerow", "checkbox", "sort", "search" ]
	});

	function insert_class() {
		classSelect = $('#classData a.jstree-clicked');
		favSelect = $('#favData a.jstree-clicked');
		select = $.merge(classSelect, favSelect);

		for (i = 0; i < select.length; i++) {

			if (select[i].id == "ROOT_anchor") {
				continue;
			}
			let id = select[i].id.substring(0, select[i].id.lastIndexOf("_anchor"));

			if ($('input:checkbox[value="' + id + '"]').length > 0) {
				continue;
			}
			$div = $('<div class="custom-control custom-checkbox"></div>');
			$checkbox = $('<input class="custom-control-input" type="checkbox" name="selectList" id="chk_'+ id +'" value="'+ id +'">');
			$label = $('<label for="chk_'+ id +'" select-id="' + id + '" class="custom-control-label">'
					+ select[i].text + '</label>');
			$div.append($checkbox);
			$div.append($label);
			$('#selectClass').append($div);
		}
	}

	function delete_class() {
		$('input:checkbox[name="selectList"]').each(function() {
			if (this.checked) {
				this.parentNode.remove();
			}
		});
	}

	window.onload = function() {
		$("#classData").unbind('dblclick');
		$("#favData").unbind('dblclick');

		let classTo = false;
		$('#classSearch').keyup(function() {
			if (classTo) {
				clearTimeout(classTo);
			}
			classTo = setTimeout(function() {
				var v = $('#classSearch').val();
				$('#classData').jstree(true).search(v);
				$('#favData').jstree(true).search(v);
			}, 250);
		});

		let memTo = false;
		$('#memSearch').keyup(function() {
			if (memTo) {
				clearTimeout(memTo);
			}
			memTo = setTimeout(function() {
				var v = $('#memSearch').val();
				$('#employeeData').jstree(true).search(v);
			}, 250);
		});
	}
</script>