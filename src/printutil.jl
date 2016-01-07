module PrintUtils
  export
  print_iter_head,
  print_iter

  function print_iter_head()
    print_double_line()
    @printf("%10s  %20s\n", "Iter", "Cost")
    print_double_line()
  end

  function print_iter(iter :: Int, cost :: Real)
    @printf("%10d  %20.4e\n", iter, cost)
  end

  # some helper functions
  function print_double_line()
    @printf("==================================\n")
  end

  function print_blank_line()
    @printf("\n")
  end
  
end
