// RUN: %target-swift-frontend %s -Xllvm -sil-print-debuginfo -Xllvm -sil-print-debuginfo-verbose -emit-sil -Onone -g -o - | %FileCheck %s
// CHECK:  %0 = alloc_stack [var_decl] $Int64, var, name "x", type $Int64, loc {{.*}} isImplicit: false, isAutoGenerated: false, isHiddenFromDebugInfo: false
// CHECK-NEXT: %1 = integer_literal $Builtin.Int64, 1, loc {{.*}} isImplicit: false, isAutoGenerated: false, isHiddenFromDebugInfo: false
// CHECK-NEXT: %2 = struct $Int64 (%1), loc {{.*}} isImplicit: false, isAutoGenerated: false, isHiddenFromDebugInfo: false
// CHECK-NEXT: store %2 to %0, loc {{.*}} isImplicit: false, isAutoGenerated: false, isHiddenFromDebugInfo: false
// CHECK-NEXT: dealloc_stack %0, loc {{.*}} isImplicit: false, isAutoGenerated: false, isHiddenFromDebugInfo: false
// CHECK-NEXT: %5 = tuple (), loc {{.*}} isImplicit: false, isAutoGenerated: false, isHiddenFromDebugInfo: false
// CHECK-NEXT: return %5, loc {{.*}} isImplicit: false, isAutoGenerated: false, isHiddenFromDebugInfo: false

func main() {
	var x : Int64 = 1
}