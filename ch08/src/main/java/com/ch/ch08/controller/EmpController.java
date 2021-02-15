package com.ch.ch08.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.ch08.model.Dept;
import com.ch.ch08.model.Emp;
import com.ch.ch08.service.DeptService;
import com.ch.ch08.service.EmpService;

@Controller
public class EmpController {
	@Autowired
	private EmpService es;
	@Autowired
	private DeptService ds;
	@RequestMapping("empList")
	public String empList(int deptno, Model model) {
		Dept dept = ds.select(deptno);
		List<Emp> empList = es.list(deptno);
		model.addAttribute("empList", empList);
		model.addAttribute("dept", dept);
		return "/emp/empList";
	}
	@RequestMapping("empInsertForm")
	public String empInsertForm(int deptno, Model model) {
		List<Dept> deptList = ds.list();
		List<Emp> empList = es.empList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("deptno", deptno);
		return "/emp/empInsertForm";
	}
	@RequestMapping(value = "empChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String empChk(int empno) {
		String data = "";
		Emp emp = es.select(empno);
		if (emp == null) data = "사용 가능한 사번입니다";
		else data = "이미 사용중인 사번입니다";
		return data;
	}
	@RequestMapping("empInsert")
	public String empInsert(Model model, Emp emp) {
		int result = 0;
		Emp emp2 = es.select(emp.getEmpno());
		if (emp2 == null) result = es.insert(emp);
		else result = -1;	// 이미 있는 사번일 경우
		model.addAttribute("result", result);
		model.addAttribute("empno", emp.getEmpno());
		return "/emp/empInsert";
	}
	@RequestMapping("empSelect")
	public String empSelect(int empno, Model model) {
		Emp emp = es.select(empno);
		model.addAttribute("emp", emp);
		return "/emp/empSelect";
	}
	@RequestMapping("empUpdateForm")
	public String empUpdateForm(int empno, Model model) {
		Emp emp = es.select(empno);
		List<Dept> deptList = ds.list();
		List<Emp> empList = es.empList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("emp", emp);
		return "/emp/empUpdateForm";
	}
	@RequestMapping("empUpdate")
	public String empUpdate(Emp emp, Model model) {
		int result = es.update(emp);
		model.addAttribute("result", result);
		model.addAttribute("emp", emp);
		return "/emp/empUpdate";
	}
	@RequestMapping("deleteEmp")
	public String deleteEmp(int empno, int deptno, Model model) {
		int result = es.delete(empno);
		model.addAttribute("result", result);
		model.addAttribute("deptno", deptno);
		return "/emp/deleteEmp";		
	}
	@RequestMapping("allEmpList")
	public String allEmpList(Model model) {
		List<Emp> list = es.allEmpList();
		model.addAttribute("list", list);		
		return "/emp/allEmpList";
	}
}
